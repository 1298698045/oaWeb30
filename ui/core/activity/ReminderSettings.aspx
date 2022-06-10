<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReminderSettings.aspx.cs"
    Inherits="WebClient.ui.core.activity.ReminderSettings" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>提醒 &amp; 警报 ~ .com - Developer Edition</title>
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ActivityReminderPage.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/setupV2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Activity.js"></script>
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
        UserContext.initialize({ "networkId": "", "labelLastModified": "1415122952000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-11-7 上午9:56", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ActivityReminderPage.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1413771514000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.207.50.255', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Fcore%2Factivity%2FReminderSettingsPage%3Fsetupid%3DReminders%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DCalendarAndReminders');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif setupTab  ReminderSettingsPage sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
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
                        <cc1:SetupNavTree2 ID="SetupNavTree1" Version="2" runat="server" />
                    </td>
                    <td class="oRight" id="bodyCell">
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="pageType noSecondHeader">
                                                提醒 &amp; 警报</h1>
                                            <div class="blank">
                                                &nbsp;</div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds('', %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a></div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <div class="bDescription">
                            系统 在一个称为“提醒窗口”的小窗口中显示提醒信息。当您登录 系统 时，如果自上次登录后触发了事件或任务提醒，则系统会显示提醒窗口并播放声音。</div>
                        <form action="/ui/core/activity/ReminderSettingsPage?setupid=Reminders" id="editPage"
                        method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
                        <input type="hidden" name="cancelURL" id="cancelURL" value="/ui/setup/Setup?setupid=CalendarAndReminders" />
                        <input type="hidden" name="retURL" id="retURL" value="/ui/setup/Setup?setupid=CalendarAndReminders" />
                        <input type="hidden" name="save_new_url" id="save_new_url" value="/ui/core/activity/ReminderSettingsPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCalendarAndReminders&amp;setupid=Reminders" />
                        <input type="hidden" name="setupid" id="setupid" value="Reminders" />
                        <div class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette"
                            id="ep">
                            <div class="pbHeader pbHeaderEmpty">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">
                                            </h2>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">
                                    错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubheader brandTertiaryBgr first tertiaryPalette" id="head_1_ep">
                                    <h3>
                                        提醒设置<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                 <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input  id="enableReminderSms" name="enableReminderSms" type="checkbox" value="1" <%=HTMLEnableReminderSms%> /><label
                                                        for="sound">接收短信提醒</label></span>
                                            </td>
                                        </tr>
                                    </table>
                                 </div>
                                <div class="pbSubheader brandTertiaryBgr first tertiaryPalette" id="head_2_ep">
                                    <h3>
                                        事件与任务<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input checked="checked" id="enable_reminders" name="enable_reminders" onclick="var e = document.getElementById('sound'); e.disabled = !this.checked; e.checked = this.checked;"
                                                        type="checkbox" value="1" /><label for="enable_reminders">提醒到期时触发报警</label></span>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input checked="checked" id="sound" name="sound" type="checkbox" value="1" /><label
                                                        for="sound">播放提醒声音</label></span>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input checked="checked" id="USEEDEF" name="event_use_default" type="checkbox" value="1" /><label
                                                        for="USEEDEF">默认情况下，将事件提醒设置为：</label>&nbsp;&nbsp;<select id="ETIME" name="default_event_time"><option
                                                            value="0">0 分钟</option>
                                                            <option value="5">5 分钟</option>
                                                            <option value="10">10 分钟</option>
                                                            <option value="15" selected="selected">15 分钟</option>
                                                            <option value="30">30 分钟</option>
                                                            <option value="60">1 小时</option>
                                                            <option value="120">2 小时</option>
                                                            <option value="180">3 小时</option>
                                                            <option value="240">4 小时</option>
                                                            <option value="300">5 小时</option>
                                                            <option value="360">6 小时</option>
                                                            <option value="420">7 小时</option>
                                                            <option value="480">8 小时</option>
                                                            <option value="540">9 小时</option>
                                                            <option value="600">10 小时</option>
                                                            <option value="660">11 小时</option>
                                                            <option value="720">0.5 天</option>
                                                            <option value="1080">18 小时</option>
                                                            <option value="1440">1 天</option>
                                                            <option value="2880">2 天</option>
                                                            <option value="4320">3 天</option>
                                                            <option value="5760">4 天</option>
                                                            <option value="10080">1 星期</option>
                                                            <option value="20160">2 星期</option>
                                                        </select></span>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input checked="checked" id="USETDEF" name="task_use_default" type="checkbox" value="1" /><label
                                                        for="USETDEF">默认情况下，将任务提醒设置为：</label>&nbsp;&nbsp;<select id="TTIME" name="default_task_time"><option
                                                            value="0">上午12:00</option>
                                                            <option value="30">上午12:30</option>
                                                            <option value="60">上午1:00</option>
                                                            <option value="90">上午1:30</option>
                                                            <option value="120">上午2:00</option>
                                                            <option value="150">上午2:30</option>
                                                            <option value="180">上午3:00</option>
                                                            <option value="210">上午3:30</option>
                                                            <option value="240">上午4:00</option>
                                                            <option value="270">上午4:30</option>
                                                            <option value="300">上午5:00</option>
                                                            <option value="330">上午5:30</option>
                                                            <option value="360">上午6:00</option>
                                                            <option value="390">上午6:30</option>
                                                            <option value="420">上午7:00</option>
                                                            <option value="450">上午7:30</option>
                                                            <option value="480" selected="selected">上午8:00</option>
                                                            <option value="510">上午8:30</option>
                                                            <option value="540">上午9:00</option>
                                                            <option value="570">上午9:30</option>
                                                            <option value="600">上午10:00</option>
                                                            <option value="630">上午10:30</option>
                                                            <option value="660">上午11:00</option>
                                                            <option value="690">上午11:30</option>
                                                            <option value="720">下午12:00</option>
                                                            <option value="750">下午12:30</option>
                                                            <option value="780">下午1:00</option>
                                                            <option value="810">下午1:30</option>
                                                            <option value="840">下午2:00</option>
                                                            <option value="870">下午2:30</option>
                                                            <option value="900">下午3:00</option>
                                                            <option value="930">下午3:30</option>
                                                            <option value="960">下午4:00</option>
                                                            <option value="990">下午4:30</option>
                                                            <option value="1020">下午5:00</option>
                                                            <option value="1050">下午5:30</option>
                                                            <option value="1080">下午6:00</option>
                                                            <option value="1110">下午6:30</option>
                                                            <option value="1140">下午7:00</option>
                                                            <option value="1170">下午7:30</option>
                                                            <option value="1200">下午8:00</option>
                                                            <option value="1230">下午8:30</option>
                                                            <option value="1260">下午9:00</option>
                                                            <option value="1290">下午9:30</option>
                                                            <option value="1320">下午10:00</option>
                                                            <option value="1350">下午10:30</option>
                                                            <option value="1380">下午11:00</option>
                                                            <option value="1410">下午11:30</option>
                                                        </select></span>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input id="reminder_sort_by_due_date" name="reminder_sort_by_due_date" type="checkbox"
                                                        value="1" /><label for="reminder_sort_by_due_date">按到期日期对提醒窗口进行排序</label></span>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input id="sharecalendar_to_all" name="sharecalendar_to_all" type="checkbox"
                                                        value="1" /><label for="sharecalendar_to_all">对所有用户公开我的日历（所有用户可以看到我的日历） </label></span>
                                            </td>
                                        </tr>
                                        <tr class="last detailRow">
                                            <td colspan='4'>
                                                <span>
                                                    <input checked="checked" id="TEMAILNOTIF" name="uns_task_delegated_email_notifications"
                                                        type="checkbox" value="1" /><label for="TEMAILNOTIF">当其他人向我分配任务时，发送电子邮件给我</label></span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_3_ep">
                                    <h3>
                                        测试并预览提醒警报<span class="titleSeparatingColon">:</span></h3>
                                </div>
                                <div class="pbSubsection">
                                    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                <span class="explanation">提醒报警应在启用后弹出。<br>
                                                    <br>
                                                    如果您在计算机上安装了阻止弹出软件，提醒报警可能无法正常运行</span>
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr class="detailRow">
                                            <td colspan='4'>
                                                测试以确定弹出阻止程序是否干扰提醒报警：
                                            </td>
                                        </tr>
                                        <tr class="last detailRow">
                                            <td colspan='4'>
                                                <input value="预览提醒报警" class="btn" id="testbtn" name="test" onclick="ActivityReminder.testPopup();"
                                                    title="预览提醒报警" type="button" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;
                                        </td>
                                        <td class="pbButtonb" id="bottomButtonRow">
                                            <input value=" 保存 " class="primary btn" title="保存" name="save" type="submit" />
                                            <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg">
                                </div>
                            </div>
                        </div>
                        <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "cancel"]); }</script>
                        </form>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { var e = document.getElementById('sound'); var t = document.getElementById('enable_reminders'); e.disabled = !t.checked; if (t.checked == false) { e.checked = false }; if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1415332358000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
    <script defer="true" src="/jslibrary/sfdc/Setup.js"></script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1413852410000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
</body>
</html>
<!-- page generation time: 161ms -->
