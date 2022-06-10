<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>短信管理 ~ 短信平台 ~  - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <script src="/jslibrary/sfdc/EmployeePicker.js"></script>
    <script>    window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-MM-dd", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1458336956000", "today": "2016-3-22 上午10:25", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'WorkShift';</script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1458071680000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1458071680000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/36.0/sprites/1454515698000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>

    <script src="/js/CommonUtils.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/easyui/themes/bootstrap/easyui.css" type="text/css" />
    <link rel="stylesheet" href="/easyui/themes/icon.css" type="text/css" />
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <style>
        #gridContainer {
            margin-top: -12px;
        }
    </style>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif contactTab  overviewPage sfdcBody brandQuaternaryBgr   ext-gecko ext-gecko3" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper" style="vertical-align: middle">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class="oRight" id="bodyCell">
                        <div class="miss-header">
                            <div class="header-left-logo">
                                <img src="/template/hearder/logo.png" />
                            </div>
                            <div class="header-left-title">
                                <p class="header-left-title-name">短信管理</p>
                                <p class="header-left-title-listname selectinput"><span>我的短信</span><img src="/img/cal/20.png" alt="" /></p>
                                <div class="selectlist selectlistcheck">
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                            <div class="header-right-buttonbtn">
                                <div class="buttonbtn-group">
                                    <div class="buttonbtn new-btn"><a href="/apps/mobile/SmsMsgEdit.aspx?t=705&retURL=%2f705%2fo">新建发送</a></div>
                                    <div class="buttonbtn new-btn copy"><a href="/apps/mobile/Sendtxt.aspx?t=705&retURL=%2f705%2fo">复制号码发送</a></div>
                                    <div class="buttonbtn new-btn"><a href="/apps/mobile/SmsLogsList.aspx?t=705&retURL=%2f705%2fo">记录查询</a></div>
                                </div>
                            </div>
                            <div class="header-right-buttonbtn">
                                <div class="buttonbtn buttonbtnsousuo">
                                    <input type="text" placeholder="搜索此列表..." id="srchText" name="srchText" class="searchtext" onchange="GridInstance.search()" />
                                </div>
                                <div class="buttonbtn viewlist selectbuttonbtn">
                                    <div class="selectlist">
                                        <span>列表控制视图</span>
                                        <ul>
                                            <li id="menuitem">新建</li>
                                            <li id="print">导出</li>
                                            <li id="copy">复制</li>
                                            <li id="New_name">重命名</li>
                                            <li id="share">共享设置</li>
                                            <li id="shaixuan">显示列表筛选器</li>
                                            <li id="Show_zi">选择要显示的字段</li>
                                            <li id="delete">删除</li>
                                            <%--<li id="Li6">Kanban设置</li>--%>
                                        </ul>
                                    </div>
                                </div>
                                <div class="buttonbtn shaixuan ban"></div>
                                <div class="buttonbtn shuaxin neww"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="objectManagerLeftNav" style="padding-top: 0; height: 100%; padding-bottom: 0;">
                            <div class="clear"></div>
                        </div>
                        <div id="gridContainer" style="min-height: 300px;">
                        </div>
                        <ctl:EasyGridListInit ID="EasyGridListInit1" runat="server" />
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() {
    setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fc%3FcType%3D2%26md2%3D13%26md0%3D2016&isAjaxRequest=1&renderMode=RETRO&nocache=1458613543622'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); };
    if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
} function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>

                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();" onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';" onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker" name="calMonthPicker" title="月"><option value="0">一月</option>
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
                                </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';" onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';" title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                </select>
                            </div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">星期日</th>
                                        <th class="dayOfWeek" scope="col">星期一</th>
                                        <th class="dayOfWeek" scope="col">星期二</th>
                                        <th class="dayOfWeek" scope="col">星期三</th>
                                        <th class="dayOfWeek" scope="col">星期四</th>
                                        <th class="dayOfWeek" scope="col">星期五</th>
                                        <th class="dayOfWeek" scope="col">星期六</th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);" onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;</td>
                                    </tr>
                                </table>
                                <div class="buttonBar"><a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a></div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="changeDiv">
        <iframe id="iframe" src=""></iframe>
    </div>
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    <link href="/template/css/shaixuan.css" rel="stylesheet" />
    <script type="text/javascript" src="/element/vue.js"></script>
    <script type="text/javascript" src="/element/element.js"></script>
    <link href="/element/element.css" rel="stylesheet" />
    <script src="/js/laydate/laydate.js"></script>
    <script src="/template/js/search.js"></script>
    <script src="/template/js/indexjs.js"></script>
    <script src="/template/js/filter.js"></script>
    <script>
        //$('.new-btn').click(function () {
        //    $('#changeDiv').show()
        //    $('#iframe').attr('src', '/alert/cntrt/new_invoicelst.html')
        //})
        //function uploadAttach(pid) {
        //    var url = "/attach/ActivityAttach.aspx?type=1&pid=" + pid;
        //    openPopup(url, 'UploadAttachment', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        //}
        function formatOper(val, row, index, entityType) {
            var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
            var a = "<a style=\"color:#015ba7;font-size:13px;\" href='/" + entityType + "/detail?id=" + rowId + "'>查看</a>";
            //a += "&nbsp;|&nbsp;<a onclick=\"setLastMousePosition(event); uploadAttach('" + rowId + "')\" style=\"color:#015ba7;font-size:13px;\" href=\"#\">上传发票</a>&nbsp;";
            return a;
        }
        function edit(id) {
            $('#changeDiv').show()
            $('#iframe').attr('src', '/alert/cntrt/new_invoicelst.html?id=' + id)
        }
        
    </script>
</body>
</html>
<!-- page generation time: 203ms -->

