<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiEventEdit.aspx.cs"
    Inherits="WebClient.ui.core.activity.ActiEventEdit" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>日历：<%=Subject%> ~ .com - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/ExtCSS-SFDC.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1416965220000/Theme3/zh/base/ManyWhoStyles.css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
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
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Activity.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script src="/jslibrary/sfdc/source/ManyWhoActivity.js"></script>
    <script>        window.sfdcPage = new EditPage(null);
        UserContext.initialize({ "networkId": "", "labelLastModified": "1416425598000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Event';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/EXT/ext-3.3.3/resources/css/ext-all-notheme.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ExtCSS-SFDC.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ManyWhoStyles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Calendar.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1413771514000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '118.186.239.71', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00U%2Fe%3FretURL%3D%252Fhome%252Fhome.jsp');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif eventTab  editPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
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
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1 class="pageType noSecondHeader">日历：新建事件</h1>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                            <!--
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a>-->
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <script type="text/javascript">
                            function updateOpener(addnl, mode) {
                                document.editPage.hdnaddn.value = addnl;
                                document.editPage.hdnrefr.value = mode;
                                document.editPage.submit();
                            }
                            function removeInvitee(id) {
                                updateOpener(id, '1', []);
                            }
                            function ivwh(elemId, otherElemId) {
                                var id = document.getElementById(elemId).value; if (otherElemId != null && (id == '' || id == '000000000000000')) { id = document.getElementById(otherElemId).value; } if (id != null && id != '' && id != '000000000000000') {
                                    updateOpener(id, '0', []);
                                }
                            };</script>
                        <!--<script src="/static/111213/js/picklist.js"></script>-->
                        <script src="/static/js/spch.js"></script>
                        <form action="/00U/e" id="editPage" method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
                            <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <input type="hidden" name="focusThisFieldOnLoad" id="focusThisFieldOnLoad" value="" />
                            <input type="hidden" name="who_id" id="who_id" value="000000000000000" />
                            <input type="hidden" id="newatt" name="newatt" value="" />
                            <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette" id="ep">
                                <div class="pbHeader">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="pbTitle">
                                                <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">事件编辑</h2>
                                            </td>
                                            <td class="pbButton" id="topButtonRow">
                                                <input value=" 保存 " class="btn" title="保存" name="save" type="submit"  style="height:25px;"/><!--
                                            <input value="保存并新建任务" class="btn" title="保存并新建任务" name="savenewtask" type="submit" />
                                                <input value="保存并新建事件" class="btn" title="保存并新建事件" name="savenewevent" type="submit"  style="height:25px;"/>-->
                                                <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit"  style="height:25px;"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbBody">
                                    <div class="pbError" id="errorDiv_ep" style="display: none">
                                        错误：无效数据。<br />
                                        请查看下列所有错误消息以纠正数据。
                                    </div>
                                    <div class="pbSubsection" style="display:none;"><table class="detailList" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="detailRow"><td colspan="4"><div id="Div1" style="display:none;"><table><tbody><tr><td><img src="/img/alert.gif" alt="报警&quot;" title="报警&quot;" width="24" height="24"></td><td>只有在您保存事件后才保存为此事件上载的附件。</td></tr>
</tbody></table></div></td></tr><tr class="last detailRow"><td colspan="4"><div class="message warningM4" id=""><table class="messageTable" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td><img src="/img/s.gif" alt="警告" class="msgIcon" title="警告"></td><td class="messageCell"><div class="messageText">您是否要更改以下任何设置？如果是的话，对于所有在 2018-7-1 当日或之后的事件，被邀请人状态将被重置为“未回复”；您将丢失带有被邀请人回复的消息，以及对单个未来事件的其他更改；未来事件链接将断开。<br><br>- 全天事件复选框<br>- 开始或结束时间<br>- 位置<br>- 周期频率<br>- 周期开始或结束日期，如果您发送更新到被邀请人<br><br>如果您不发送更新，并且只扩展周期结束日期，则未来事件不会受影响。<br><br><a href="javascript:openPopupFocusEscapePounds('', 'Help', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);">了解更多</a></div></td></tr>
</tbody></table></div><script>if (window.sfdcPage) sfdcPage.registerMessage('');</script></td></tr></tbody></table></div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr class="last detailRow">
                                                <td colspan='4'>
                                                    <div id="attWarning" style="display: none;">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <img src="/img/alert.gif" alt="报警&quot;" width="24" height="24" title="报警&quot;" />
                                                                </td>
                                                                <td>只有在您保存事件后才保存为此事件上载的附件。
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_1_ep">
                                        <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                            <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                class="requiredText"> = 必填信息</span></span></span><h3>日历详细信息<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="evt5">
                                                        <span class="requiredMark">*</span>主题</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <script type="text/javascript">
                                                            var cb_evt5 = new Array();
                                                            /*
                                                            cb_evt5[0] = 'Call';
                                                            cb_evt5[1] = 'Email';
                                                            cb_evt5[2] = 'Meeting';
                                                            cb_evt5[3] = 'Send Letter/Quote';
                                                            cb_evt5[4] = 'Other';
                                                            */
                                                            cb_evt5[0] = '会议';//'Call';
                                                            cb_evt5[1] = '出差';//'Email';
                                                            cb_evt5[2] = '出差';//'Send Letter';
                                                            cb_evt5[3] = '出国';
                                                            //cb_evt5[4] = '发信/报价';//'Send Quote';
                                                            cb_evt5[4] = '其他';//'Other';
                                                        </script>
                                                        <input id="evt5" maxlength="255" name="evt5" size="20" tabindex="2" type="text" value="<%=Subject%>" /><a
                                                            href="javascript:openPopupFocus%28%27%2Fwidg%2Fcombobox.aspx%3Fform%3DeditPage%26field%3Devt5%26display%3D1%26cnt%3D5%27%2C%20%27_blank%27%2C%20270%2C%20200%2C%20%27width%3D270%2Cheight%3D200%2Cresizable%3Dyes%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cscrollbars%3Dyes%2Cmenubar%3Dno%2Cdirectories%3Dno%2Clocation%3Dno%2Cdependant%3Dyes%27%2C%20true%2C%20true%29%3B"
                                                            onclick="setLastMousePosition(event)" size="20" tabindex="2" title="组合框 （新窗口）"><img
                                                                src="/s.gif" alt="主题 组合框 （新窗口）" class="comboboxIcon" onblur="this.className = 'comboboxIcon';"
                                                                onfocus="this.className = 'comboboxIconOn';" onmouseout="this.className = 'comboboxIcon';this.className = 'comboboxIcon';"
                                                                onmouseover="this.className = 'comboboxIconOn';this.className = 'comboboxIconOn';"
                                                                title="主题 组合框 （新窗口）" /></a>
                                                    </div>
                                                </td>
                                                <td class="labelCol requiredInput">
                                                    <label for="evt1">
                                                        <span class="requiredMark">*</span>被分配人</label>
                                                </td>
                                                <td class="dataCol col02">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock"></div>
                                                        <label class="assistiveText" for="evt1_mlktp"><span class="assistiveText">*</span>搜索范围</label>
                                                        <div id="evt1_top" name="evt1_top" style="white-space: nowrap">
                                                        用户
                                                        <input type="hidden" name="evt1_lkid" id="evt1_lkid" value="<%=OwningUser%>" /><input
                                                            type="hidden" name="evt1_lkold" id="evt1_lkold" value="<%=OwningUserName%>" /><input
                                                                type="hidden" name="evt1_lktp" id="evt1_lktp" value="StandardUserLookup" /><input
                                                                    type="hidden" name="evt1_lspf" id="evt1_lspf" value="0" /><input type="hidden" name="evt1_lspfsub"
                                                                        id="evt1_lspfsub" value="0" /><input type="hidden" name="evt1_mod" id="evt1_mod"
                                                                            value="0" /><input type="hidden" id="evt1_onpk" name="evt1_onpk" value="document.editPage.focusThisFieldOnLoad.value='evt1';" />
                                                        <span class="lookupInput">
                                                            <input id="evt1" maxlength="255" name="evt1" onchange="getElementByIdCS('evt1_lkid').value='';getElementByIdCS('evt1_mod').value='1';document.editPage.focusThisFieldOnLoad.value='evt1';"
                                                                size="20" tabindex="1" type="text" value="<%=OwningUserName%>" /><a href="javascript:%20openLookup%28%27%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26lknm%3Devt1%26lktp%3D%27%20%2B%20getElementByIdCS%28%27evt1_lktp%27%29.value%2C670%2C%271%27%2C%27%26lksrch%3D%27%20%2B%20escapeUTF%28getElementByIdCS%28%27evt1%27%29.value.substring%280%2C%2080%29%29%29"
                                                                    id="evt1_lkwgt" onclick="setLastMousePosition(event)" tabindex="1" title="被分配人 查找（新窗口）"><img
                                                                        src="/s.gif" alt="被分配人 查找（新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                                        onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                                        onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                        title="被分配人 查找（新窗口）" /></a></span>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">
                                                    <label for="evt12">
                                                        位置</label>
                                                </td>
                                                <td class="dataCol">
                                                    <input id="evt12" maxlength="255" name="evt12" size="20" tabindex="7" type="text"
                                                        value="<%=Location%>" /><input type="checkbox" id="outOfOffice" name="outOfOffice" value="1" <%=OutOfOfficeCheckHTML%> />外出
                                                </td>
                                                <td class="labelCol empty"></td>
                                                <td class="dataCol empty"></td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="StartDateTime">
                                                        <span class="requiredMark">*</span>开始</label>
                                                </td>
                                                <td class="dataCol">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <span class="dateInput dateOnlyInput">
                                                            <input id="StartDateTime" name="StartDateTime" onchange="ActivityFunction.updateDates(&#39;StartDateTime&#39;, [&quot;reminder_dt&quot;,&quot;RecurrenceStartDateTime&quot;,&quot;EndDateTime&quot;], true);ActivityFunction.updateCalendar([&quot;evt1&quot;,&quot;evt1_lkid&quot;,&quot;StartDateTime&quot;,&quot;EndDateTime&quot;,&quot;evt15&quot;,&quot;hh&quot;,&quot;mi&quot;,&quot;IsRecurrence&quot;,&quot;RecurrenceStartDateTime&quot;,&quot;RecurrenceEndDateOnly&quot;,&quot;rectype&quot;,&quot;recd&quot;,&quot;recm&quot;,&quot;recy&quot;,&quot;invtee&quot;]);ActivityFunction.saveStartTime(&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;);ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                                onfocus="DatePicker.pickDate(true, 'StartDateTime', false);" size="10" tabindex="8"
                                                                type="text" value="<%=ScheduledStart%>" /><!--<select id="StartDateTime_time" name="StartDateTime_time">
                                                                <option value="08:00">08:00</option>
                                                                 <option value="08:30">08:30</option>
                                                                 <option value="09:00">09:00</option>
                                                                 <option value="09:30">09:30</option>
                                                                 <option value="10:00">10:00</option>
                                                                 <option value="10:30">10:30</option>
                                                                 <option value="11:00">11:00</option>
                                                                 <option value="11:30">11:30</option>
                                                                 <option value="12:00">12:00</option>
                                                                 <option value="12:30">12:30</option>
                                                                 <option value="13:00">13:00</option>
                                                                 <option value="13:30">13:30</option>
                                                                 <option value="14:00">14:00</option>
                                                                 <option value="14:30">14:30</option>
                                                                 <option value="15:00">15:00</option>
                                                                 <option value="15:30">15:30</option>
                                                                 <option value="16:00">16:00</option>
                                                                 <option value="16:30">16:30</option>
                                                                 <option value="17:00">17:00</option>
                                                                 <option value="17:30">17:30</option>
                                                                 <option value="18:00">18:00</option>
                                                                 <option value="18:30">18:30</option>                                                            
                                                                
                                                                
                                                                                                      </select>--><span class="timeInput"><input autocomplete="off"
                                                                                                          id="StartDateTime_time" name="StartDateTime_time" onchange="ActivityFunction.updateEndTime(&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;, &#39;EndDateTime&#39;, &#39;EndDateTime_time&#39;);ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                                                                          onfocus="ActivityFunction.saveStartTime(&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;);ActivityFunction.showTimePicker(&#39;StartDateTime_time&#39;)"
                                                                                                          size="8" tabindex="9" type="text" value="<%=ScheduledStartTime%>" />
                                                                                                          <span class="dateFormat">[&nbsp;<a href="#" onclick="var inputField = getElementByIdCS('StartDateTime_time');if (inputField && !inputField.disabled && inputField.value != '<%=DateNowTime%>') { inputField.value = '<%=DateNowTime%>'; if (inputField.onchange) {inputField.onchange();}}return false;"><%=DateNowTime%></a>&nbsp;]</span>
                                                                                                      </span></span>
                                                    </div>
                                                </td>
                                                <td class="labelCol empty"></td>
                                                <td class="dataCol empty"></td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol requiredInput">
                                                    <label for="EndDateTime">
                                                        <span class="requiredMark">*</span>结束</label>
                                                </td>
                                                <td class="dataCol">
                                                    <div class="requiredInput">
                                                        <div class="requiredBlock">
                                                        </div>
                                                        <span class="dateInput dateOnlyInput">
                                                            <input id="EndDateTime" name="EndDateTime" onchange="ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                                onfocus="DatePicker.pickDate(true, 'EndDateTime', false);" size="10" tabindex="10"
                                                                type="text" value="<%=ScheduledEnd%>" /><span class="timeInput"><input autocomplete="off"
                                                                    id="EndDateTime_time" name="EndDateTime_time" onchange="ActivityFunction.checkDuration(&#39;IsRecurrence&#39;,&#39;evt15&#39;,&#39;StartDateTime&#39;,&#39;StartDateTime_time&#39;,&#39;EndDateTime&#39;,&#39;EndDateTime_time&#39;);"
                                                                    onfocus="ActivityFunction.showTimePicker(&#39;EndDateTime_time&#39;)" size="8"
                                                                    tabindex="11" type="text" value="<%=ScheduledEndTime%>" />
                                                                    <span class="dateFormat">[&nbsp;<a href="#" onclick="var inputField = getElementByIdCS('EndDateTime_time');if (inputField && !inputField.disabled && inputField.value != '<%=DateNowTime%>') { inputField.value = '<%=DateNowTime%>'; if (inputField.onchange) {inputField.onchange();}}return false;"><%=DateNowTime%></a>&nbsp;]</span></span></span>
                                                    </div>
                                                </td>
                                                <td class="labelCol empty"></td>
                                                <td class="dataCol empty"></td>
                                            </tr><!--
                                            <tr>                                               
                                                <td class="labelCol">
                                                    <label for="evt15">全天事件</label></td>
                                                <td class="dataCol col02">
                                                </td>
                                                 <td class="labelCol">
                                                    <label for="evt10">
                                                        类型</label>
                                                </td>
                                                <td class="dataCol">
                                                    <span>
                                                        <select tabindex="7" name="evt10" id="evt10">
                                                            <option value="">--无--</option>
                                                            <option value="Email">邮件</option>
                                                            <option value="Meeting">会议</option>
                                                            <option value="Other">其他</option>
                                                            <option value="Call">电话</option>
                                                        </select></span><script>  //   new picklist('evt10', '30', null, ['', ''], ' id=\"evt10\" name=\"evt10\" tabindex=\"7\"', true, true);</script>
                                                </td>
                                            </tr> -->                                          
                                        <tr>
                                            <td class="labelCol">
                                                电话
                                            </td>
                                            <td class="dataCol col02">
                                                &nbsp;
                                            </td>
                                            <td class="labelCol">
                                                <label for="evt15">
                                                    全天事件</label>
                                            </td>
                                            <td class="dataCol">
                                                <input id="evt15" name="evt15" onclick="ActivityFunction.clearTimeElements('evt15','IsRecurrence','evt13','StartDateTime','StartDateTime_time','EndDateTime','EndDateTime_time',true);ActivityFunction.adjustEventReminderOptions(false,'evt15',false,'IsRecurrence','reminder_dt_time');ActivityFunction.checkDuration('IsRecurrence','evt15','StartDateTime','StartDateTime_time','EndDateTime','EndDateTime_time');"
                                                    tabindex="12" type="checkbox" value="1" <%if (IsAllDayEvent)
                                                                                              { %> checked="checked"
                                                    <%} %> />
                                            </td>
                                        </tr>
                                            <tr>
                                                <td class="last labelCol">
                                                    <label for="evt6">
                                                        内容</label><div class="textCounterOuter">
                                                            <div class="textCounterMiddle">
                                                                <div id="evt6_counter" class="textCounter">
                                                                    32000 剩余
                                                                </div>
                                                            </div>
                                                        </div>
                                                </td>
                                                <td class="dataCol col02 last" colspan="3">
                                                    <textarea wrap="soft" type="text" tabindex="8" onmousedown="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                        onkeyup="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                        onkeydown="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                        onclick="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                        onchange="handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限');"
                                                        name="evt6" maxlength="32000" id="evt6" cols="75" rows="5"><%=Description%></textarea>
                                                </td>

                                            </tr>
                                        </table>
                                    </div>
                                    <div id="head_2_ep" class="brandTertiaryBgr pbSubheader tertiaryPalette" style="white-space: nowrap; display: none">
                                        <h3>相关<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection" style="white-space: nowrap; display: none">
                                        <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                                            <tbody>
                                                <tr>
                                                    <td class="last labelCol">
                                                        <label for="evt2_top">
                                                            名称</label>
                                                    </td>
                                                    <td class="dataCol col02 last">
                                                        <div style="white-space: nowrap; display: none" onkeyup="Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElemKeyupHandler(event)"
                                                            name="evt2_top" id="evt2_top">
                                                            <select title="搜索范围" tabindex="10" onkeyup="Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElemKeyupHandler(event)"
                                                                onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('evt2',false);ActivityFunction.adjwht('evt2_mlktp');Sfdc.Activity.ManyWhoFunction.flipManyWhoContactField();"
                                                                name="evt2_mlktp" id="evt2_mlktp">
                                                                <option selected="selected" value="003">联系人</option>
                                                                <option value="00Q">潜在客户</option>
                                                            </select><input type="hidden" value="000000000000000" id="evt2_lkid" name="evt2_lkid"><input
                                                                type="hidden" value="null" id="evt2_lkold" name="evt2_lkold"><input type="hidden"
                                                                    value="003" id="evt2_lktp" name="evt2_lktp"><input type="hidden" value="0" id="evt2_lspf"
                                                                        name="evt2_lspf"><input type="hidden" value="0" id="evt2_lspfsub" name="evt2_lspfsub"><input
                                                                            type="hidden" value="0" id="evt2_mod" name="evt2_mod"><span class="lookupInput"><textarea
                                                                                id="evt2_manyWContactField" class="manyWhoContactFieldEmpty" readonly="readonly"
                                                                                cols="30" rows="1" onclick="setLastMousePosition(event); Sfdc.Activity.ManyWhoFunction.launchWhoPicker();"
                                                                                title="名称" tabindex="11" style="display: none; visibility: hidden;"></textarea><input
                                                                                    type="text" title="名称" tabindex="11" size="20" onkeyup="Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElemKeyupHandler(event)"
                                                                                    onchange="getElementByIdCS('evt2_lkid').value='';getElementByIdCS('evt2_mod').value='1';Sfdc.Activity.ManyWhoFunction.clearManyWhoHtmlFields()"
                                                                                    name="evt2" maxlength="255" id="evt2" style="display: inline; visibility: visible;"><a
                                                                                        title="名称 查找（新窗口）" tabindex="11" onkeyup="Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElemKeyupHandler(event)"
                                                                                        onclick="setLastMousePosition(event)" id="whobtn" href="javascript:Sfdc.Activity.ManyWhoFunction.launchSingleOrManyWhoPicker%28%27javascript%3A%20openLookup%28%5C%27%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26amp%3Blknm%3Devt2%26amp%3Blktp%3D%5C%27%20%2B%20getElementByIdCS%28%5C%27evt2_lktp%5C%27%29.value%2C670%2C%5C%271%5C%27%2C%5C%27%26amp%3Blksrch%3D%5C%27%20%2B%20escapeUTF%28getElementByIdCS%28%5C%27evt2%5C%27%29.value.substring%280%2C%2080%29%29%29%27%29%3B"><img
                                                                                            title="名称 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                            onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                            onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="名称 查找（新窗口）" src="/s.gif"></a><span
                                                                                                class="bodySmall">[ </span><a class="bodySmall" href="javascript:if(document.getElementById(%27evt2_mlktp%27).value != ActivityFunction.leadPrefix) { document.editPage.focusThisFieldOnLoad.value=%27evt2_manyWName%27;ivwh(%27evt2_manyWId%27,%27evt2_lkid%27);} else { document.editPage.focusThisFieldOnLoad.value=%27evt2%27;ivwh(%27evt2_lkid%27, null);}">添加到被邀请人</a><span class="bodySmall"> ]</span><input type="hidden" value="" name="evt2_manyWId"
                                                                                                    id="evt2_manyWId"><input type="hidden" value="[]" name="evt2_manyWName" id="evt2_manyWName"><input
                                                                                                        type="hidden" value="[]" name="evt2_manyWTitle" id="evt2_manyWTitle"><input type="hidden"
                                                                                                            value="[]" name="evt2_manyWCompany" id="evt2_manyWCompany"><input type="hidden" value="[]"
                                                                                                                name="evt2_manyWOwner" id="evt2_manyWOwner"><input type="hidden" value="1" name="evt2_manyWAccessBit"
                                                                                                                    id="evt2_manyWAccessBit">
                                                                                <script type="text/javascript">
                                                                                    var dialog = OverlayDialogElement.getDialog('mw_picker_');
                                                                                    dialog.isModal = true;
                                                                                    dialog.width = 762;
                                                                                    dialog.hasButtonsBar = true;
                                                                                    dialog.displayX = true;
                                                                                    dialog.allowKeyboardEsc = true;
                                                                                    dialog.extraClass = '';
                                                                                    dialog.isAbsolutePositioned = false;
                                                                                    dialog.refreshOnClose = false;
                                                                                    dialog.isMovable = true;
                                                                                    dialog.buttonContents = '\u003Cinput value=\" 完成 \"  class=\"btn\" id=\"mw_picker_save_btn\" name=\"saveBtn\" onclick=\"Sfdc.Activity.PeoplePicker.who.onPickerDone();\" title=\"完成 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"mw_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"Sfdc.Activity.PeoplePicker.who.onPickerCancel();\" title=\"取消 (Esc)\" type=\"button\" /\u003E';
                                                                                    dialog.setTitle('选择联系人');
                                                                                    dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"mw_picker_header_label\"\u003E您可以将此 事件 与至多 50 个联系人关联，包括指定的主要联系人。 \u003Ca class=\"help_link\" href=\"javascript:openPopupFocusEscapePounds(\'\', \'Help\', 1024, 768, \'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no\', false, false);\" id=\"mw_picker_tell_me_more_link\" name=\"tell_me_more\" title=\"了解详细信息！ （新窗口）\"\u003E了解详细信息！\u003C/a\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"mw_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cdiv class=\"search_text_div\" id=\"mw_picker_search_text_div\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"mw_picker_search_prefix\" maxlength=\"30\" name=\"mw_picker_search_prefix\" onkeydown=\"Sfdc.Activity.PeoplePicker.who.onSearchKeyDown(event)\" onkeyup=\"Sfdc.Activity.PeoplePicker.who.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"mw_picker_search_clear_text_btn\" onclick=\"Sfdc.Activity.PeoplePicker.who.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.Activity.PeoplePicker.who.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"mw_picker_search_btn\" name=\"mw_picker_search_btn\" onclick=\"Sfdc.Activity.PeoplePicker.who.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message infoM4 overlimit_results\" id=\"mw_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'mw_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"mw_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"mw_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"mw_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"mw_picker_found_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.who.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.who.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.Activity.PeoplePicker.who.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.Activity.PeoplePicker.who.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"mw_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"mw_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"mw_picker_selected_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.who.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.who.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"make_primary\"\u003E创建\u003Cbr/\u003E\u003Cspan  style=\"color: green;\"\u003E主要\u003C/span\u003E\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"mw_picker_primary_button\" name=\"mw_picker_primary_button\" onclick=\"Sfdc.Activity.PeoplePicker.who.makePrimary();\"\u003E\u003Cdiv class=\"upArrowIcon\" title=\"创建主要的 (Shift-P)\"\u003E\u003C/div\u003E\u003C/a\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"mw_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';
                                                                                </script>
                                                                                <div id="whoTipText" class="whoTipDiv">
                                                                                    <span><b>提示：</b>单击查找图标可选择多个联系人。 </span>
                                                                                    <a onclick="Sfdc.Activity.ManyWhoFunction.dismissWhoTipElem()" href="javascript:void(0)">消除</a>
                                                                                </div>
                                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td class="last labelCol">
                                                        <label for="evt3_top">
                                                            相关项</label>
                                                    </td>
                                                    <td class="last dataCol">
                                                        <div style="white-space: nowrap; display: none" name="evt3_top" id="evt3_top">
                                                            <select title="搜索范围" tabindex="12" onchange="LookupAutoCompleteInputElement.handleLookupTypeChange('evt3',false);"
                                                                name="evt3_mlktp" id="evt3_mlktp">
                                                                <option value="0Q0">报价</option>
                                                                <option value="01t">产品</option>
                                                                <option value="801">订单</option>
                                                                <option value="500">个案</option>
                                                                <option value="800">合同</option>
                                                                <option value="501">解决方案</option>
                                                                <option value="001">客户</option>
                                                                <option value="701">市场活动</option>
                                                                <option selected="selected" value="006">业务机会</option>
                                                                <option value="02i">资产</option>
                                                            </select><input type="hidden" value="000000000000000" id="evt3_lkid" name="evt3_lkid"><input
                                                                type="hidden" value="null" id="evt3_lkold" name="evt3_lkold"><input type="hidden"
                                                                    value="006" id="evt3_lktp" name="evt3_lktp"><input type="hidden" value="0" id="evt3_lspf"
                                                                        name="evt3_lspf"><input type="hidden" value="0" id="evt3_lspfsub" name="evt3_lspfsub"><input
                                                                            type="hidden" value="0" id="evt3_mod" name="evt3_mod"><span class="lookupInput"><input
                                                                                type="text" title="相关项" tabindex="13" size="20" onchange="getElementByIdCS('evt3_lkid').value='';getElementByIdCS('evt3_mod').value='1';"
                                                                                name="evt3" maxlength="255" id="evt3"><a title="相关项 查找（新窗口）" tabindex="13" onclick="setLastMousePosition(event)"
                                                                                    id="whtbtn" href="javascript:%20openLookup%28%27%2F_ui%2Fcommon%2Fdata%2FLookupPage%3Flkfm%3DeditPage%26lknm%3Devt3%26lkrf%3Dpip%26sn%3D1%26lktp%3D%27%20%2B%20getElementByIdCS%28%27evt3_lktp%27%29.value%2C670%2C%271%27%2C%27%26lksrch%3D%27%20%2B%20escapeUTF%28getElementByIdCS%28%27evt3%27%29.value.substring%280%2C%2080%29%29%29"><img
                                                                                        title="相关项 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                                                        onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                                                                        onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="相关项 查找（新窗口）"
                                                                                        src="/s.gif"></a><span style="display: none" id="addInvId"><span class="bodySmall">[
                                                                                        </span><a class="bodySmall" href="javascript:document.editPage.focusThisFieldOnLoad.value=%27evt3%27;ivwh(%27evt3_lkid%27, null);">添加到被邀请人</a><span class="bodySmall"> ]</span><input type="hidden" value="" name="pip"
                                                                                            id="pip"></span></span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_3_ep">
                                        <h3>周期<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr class="detailRow">
                                                <td colspan='4'>
                                                    <div>
                                                        <input id="IsRecurrence" name="IsRecurrence" onclick="ActivityFunction.selectMakeRecurring('IsRecurrence', 'evt15', 'evt4', 'StartDateTime', 'EndDateTime'); Sfdc.Activity.ManyWhoFunction.onRecurrenceChange();"
                                                            type="checkbox" value="1" <%=IsRecurrenceHTML%>/><label for="IsRecurrence">创建事件的重复序列</label><div class="hiddenWarning"
                                                                id="DisabledRecurrenceMsgDiv">
                                                                （您不能创建重复性事件，包括超过 24 小时长的搜索项）
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="last detailRow">
                                                <td colspan='4'>
                                                    <div id="recpat" style="display: none">
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label>
                                                                        频率</label>
                                                                </td>
                                                                <td>
                                                                    <table class="recurrenceTable">
                                                                        <tr>
                                                                            <td>
                                                                                <div>
                                                                                    <div>
                                                                                        <input checked="checked" id="rectypeftd" name="rectype" onclick="ActivityFunction.adjustRecurrenceFrequency('d');"
                                                                                            type="radio" value="ftd" /><label for="rectypeftd">每日</label><script>    document.getElementById("rectypeftd").checked = true;</script>
                                                                                    </div>
                                                                                    <div>
                                                                                        <input id="rectypeftw" name="rectype" onclick="ActivityFunction.adjustRecurrenceFrequency('w'); ActivityFunction.setDayOfWeekDefault('RecurrenceStartDateTime');"
                                                                                            type="radio" value="ftw" /><label for="rectypeftw">每周</label>
                                                                                    </div>
                                                                                    <div>
                                                                                        <input id="rectypeftm" name="rectype" onclick="ActivityFunction.adjustRecurrenceFrequency('m');"
                                                                                            type="radio" value="ftm" /><label for="rectypeftm">每月</label>
                                                                                    </div>
                                                                                    <div style="display:none;">
                                                                                        <input id="rectypefty" name="rectype" onclick="ActivityFunction.adjustRecurrenceFrequency('y');"
                                                                                            type="radio" value="fty" /><label for="rectypefty">每年</label>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="periodElementGroup" id="d" style="display:block ">
                                                                                    <div>
                                                                                        <input checked="checked" id="recdd0" name="recd" title="每工作日重复" type="radio" value="d0" /><label
                                                                                            for="recdd0">每个工作日</label><script>  document.getElementById("recdd0").checked = true;</script>
                                                                                    </div>
                                                                                    <div style="display:none">
                                                                                        <input id="recdd1" name="recd" title="指定间隔为天" type="radio" value="d1" /><label for="recdd1"></label>每
                                                                                    <input id="di" name="di" onkeypress="document.getElementById('recdd1').checked=true;" size="3" title="指定间隔为天" type="text" value="1" />
                                                                                        天
                                                                                    </div>
                                                                                </div>
                                                                                <div class="periodElementGroup" id="w" style="display: none">
                                                                                    <div>
                                                                                        每
                                                                                    <input id="wi" name="wi" size="3" title="指定间隔为周" type="text" value="1" />
                                                                                        个星期重复
                                                                                    </div>
                                                                                    <div>
                                                                                        <input id="1" name="1" type="checkbox" value="1" /><label for="1">星期日</label><input
                                                                                            id="2" name="2" type="checkbox" value="1" /><label for="2">星期一</label><input id="4"
                                                                                                name="4" type="checkbox" value="1" /><label for="4">星期二</label><input id="8" name="8"
                                                                                                    type="checkbox" value="1" /><label for="8">星期三</label><input id="16" name="16" type="checkbox"
                                                                                                        value="1" /><label for="16">星期四</label><input id="32" name="32" type="checkbox" value="1" /><label
                                                                                                            for="32">星期五</label><input id="64" name="64" type="checkbox" value="1" /><label for="64">星期六</label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="periodElementGroup" id="m" style="display: none">
                                                                                    <div>
                                                                                        <input checked="checked" id="recmm0" name="recm" title="指定天数为月和每月间隔" type="radio"
                                                                                            value="m0" /><label for="recmm0"></label><script>  document.getElementById("recmm0").checked = true;</script>每隔
                                                                                    <input id="mint" name="mint" onkeypress="document.getElementById('recmm0').checked=true;"
                                                                                        size="3" title="指定间隔为月" type="text" value="1" />
                                                                                        月的
                                                                                    <select id="mdom" name="mdom" onchange="document.getElementById('recmm0').checked=true;"
                                                                                        title="选择月份中的一天">
                                                                                        <option value="1" selected="selected">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                        <option value="4">4</option>
                                                                                        <option value="5">5</option>
                                                                                        <option value="6">6</option>
                                                                                        <option value="7">7</option>
                                                                                        <option value="8">8</option>
                                                                                        <option value="9">9</option>
                                                                                        <option value="10">10</option>
                                                                                        <option value="11">11</option>
                                                                                        <option value="12">12</option>
                                                                                        <option value="13">13</option>
                                                                                        <option value="14">14</option>
                                                                                        <option value="15">15</option>
                                                                                        <option value="16">16</option>
                                                                                        <option value="17">17</option>
                                                                                        <option value="18">18</option>
                                                                                        <option value="19">19</option>
                                                                                        <option value="20">20</option>
                                                                                        <option value="21">21</option>
                                                                                        <option value="22">22</option>
                                                                                        <option value="23">23</option>
                                                                                        <option value="24">24</option>
                                                                                        <option value="25">25</option>
                                                                                        <option value="26">26</option>
                                                                                        <option value="27">27</option>
                                                                                        <option value="28">28</option>
                                                                                        <option value="29">29</option>
                                                                                        <option value="30">30</option>
                                                                                        <option value="31">31</option>
                                                                                    </select>
                                                                                        日
                                                                                    </div>
                                                                                    <div  style="display:none">
                                                                                        <input id="recmm1" name="recm" title="指定哪个星期的哪天和每月间隔" type="radio" value="m1" /><label
                                                                                            for="recmm1"></label>每隔
                                                                                    <input id="mnint" name="mnint" onkeypress="document.getElementById('recmm1').checked=true;"
                                                                                        size="3" title="指定间隔为月" type="text" value="1" />
                                                                                        月的
                                                                                    <select id="mnins" name="mnins" onchange="document.getElementById('recmm1').checked=true;"
                                                                                        title="选择月份的某周">
                                                                                        <option value="1" selected="selected">第一次</option>
                                                                                        <option value="2">第二次</option>
                                                                                        <option value="3">第三次</option>
                                                                                        <option value="4">第四次</option>
                                                                                        <option value="5">最后</option>
                                                                                    </select>
                                                                                        <select id="mndow" name="mndow" onchange="document.getElementById('recmm1').checked=true;"
                                                                                            title="选择周的一天">
                                                                                            <option value="127" selected="selected">天</option>
                                                                                            <option value="1">星期日</option>
                                                                                            <option value="2">星期一</option>
                                                                                            <option value="4">星期二</option>
                                                                                            <option value="8">星期三</option>
                                                                                            <option value="16">星期四</option>
                                                                                            <option value="32">星期五</option>
                                                                                            <option value="64">星期六</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                                <div id="y" style="display: none">
                                                                                    <div>
                                                                                        <input checked="checked" id="recyy0" name="recy" title="指定月和日" type="radio" value="y0" /><label
                                                                                            for="recyy0"></label><script>                                                                                                                 document.getElementById("recyy0").checked = true;</script>每隔
                                                                                    <select id="ymoy" name="ymoy" onchange="document.getElementById('recyy0').checked=true;"
                                                                                        title="选择月">
                                                                                        <option value="0">一月</option>
                                                                                        <option value="1">二月</option>
                                                                                        <option value="2">三月</option>
                                                                                        <option value="3">四月</option>
                                                                                        <option value="4">五月</option>
                                                                                        <option value="5">六月</option>
                                                                                        <option value="6">七月</option>
                                                                                        <option value="7">八月</option>
                                                                                        <option value="8">九月</option>
                                                                                        <option value="9">十月</option>
                                                                                        <option value="10" selected="selected">十一月</option>
                                                                                        <option value="11">十二月</option>
                                                                                    </select>
                                                                                        <select id="ydom" name="ydom" onchange="document.getElementById('recyy0').checked=true;"
                                                                                            title="选择月份中的一天">
                                                                                            <option value="1" selected="selected">1</option>
                                                                                            <option value="2">2</option>
                                                                                            <option value="3">3</option>
                                                                                            <option value="4">4</option>
                                                                                            <option value="5">5</option>
                                                                                            <option value="6">6</option>
                                                                                            <option value="7">7</option>
                                                                                            <option value="8">8</option>
                                                                                            <option value="9">9</option>
                                                                                            <option value="10">10</option>
                                                                                            <option value="11">11</option>
                                                                                            <option value="12">12</option>
                                                                                            <option value="13">13</option>
                                                                                            <option value="14">14</option>
                                                                                            <option value="15">15</option>
                                                                                            <option value="16">16</option>
                                                                                            <option value="17">17</option>
                                                                                            <option value="18">18</option>
                                                                                            <option value="19">19</option>
                                                                                            <option value="20">20</option>
                                                                                            <option value="21">21</option>
                                                                                            <option value="22">22</option>
                                                                                            <option value="23">23</option>
                                                                                            <option value="24">24</option>
                                                                                            <option value="25">25</option>
                                                                                            <option value="26">26</option>
                                                                                            <option value="27">27</option>
                                                                                            <option value="28">28</option>
                                                                                            <option value="29">29</option>
                                                                                            <option value="30">30</option>
                                                                                            <option value="31">31</option>
                                                                                        </select>
                                                                                    </div>
                                                                                    <div>
                                                                                        <input id="recyy1" name="recy" title="指定特定月份的特定周中的一天" type="radio" value="y1" /><label
                                                                                            for="recyy1"></label><select id="ynmoy" name="ynmoy" onchange="document.getElementById('recyy1').checked=true;"
                                                                                                title="选择月"><option value="0">一月</option>
                                                                                                <option value="1">二月</option>
                                                                                                <option value="2">三月</option>
                                                                                                <option value="3">四月</option>
                                                                                                <option value="4">五月</option>
                                                                                                <option value="5">六月</option>
                                                                                                <option value="6">七月</option>
                                                                                                <option value="7">八月</option>
                                                                                                <option value="8">九月</option>
                                                                                                <option value="9">十月</option>
                                                                                                <option value="10" selected="selected">十一月</option>
                                                                                                <option value="11">十二月</option>
                                                                                            </select>
                                                                                        的
                                                                                    <select id="ynins" name="ynins" onchange="document.getElementById('recyy1').checked=true;"
                                                                                        title="选择月份的某周">
                                                                                        <option value="1" selected="selected">第一次</option>
                                                                                        <option value="2">第二次</option>
                                                                                        <option value="3">第三次</option>
                                                                                        <option value="4">第四次</option>
                                                                                        <option value="5">最后</option>
                                                                                    </select>
                                                                                        <select id="yndow" name="yndow" onchange="document.getElementById('recyy1').checked=true;"
                                                                                            title="选择周的一天">
                                                                                            <option value="127" selected="selected">天</option>
                                                                                            <option value="1">星期日</option>
                                                                                            <option value="2">星期一</option>
                                                                                            <option value="4">星期二</option>
                                                                                            <option value="8">星期三</option>
                                                                                            <option value="16">星期四</option>
                                                                                            <option value="32">星期五</option>
                                                                                            <option value="64">星期六</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol requiredInput">
                                                                    <label for="RecurrenceStartDateTime">
                                                                        定期开始</label>
                                                                </td>
                                                                <td class="data2Col col02">
                                                                    <div class="requiredInput">
                                                                        <div class="requiredBlock">
                                                                        </div>
                                                                        <span class="dateInput dateOnlyInput">
                                                                            <input id="RecurrenceStartDateTime" name="RecurrenceStartDateTime" onchange="ActivityFunction.updateDates(&#39;RecurrenceStartDateTime&#39;, [&quot;reminder_dt&quot;,&quot;StartDateTime&quot;,&quot;EndDateTime&quot;], true);ActivityFunction.updateCalendar([&quot;evt1&quot;,&quot;evt1_lkid&quot;,&quot;StartDateTime&quot;,&quot;EndDateTime&quot;,&quot;evt15&quot;,&quot;hh&quot;,&quot;mi&quot;,&quot;IsRecurrence&quot;,&quot;RecurrenceStartDateTime&quot;,&quot;RecurrenceEndDateOnly&quot;,&quot;rectype&quot;,&quot;recd&quot;,&quot;recm&quot;,&quot;recy&quot;,&quot;invtee&quot;]);"
                                                                                onfocus="DatePicker.pickDate(true, 'RecurrenceStartDateTime', false);" size="12"
                                                                                type="text" value="<%=RecurrenceStartDateTime%>" /><span class="dateFormat">[&nbsp;<a href="javascript:DatePicker.insertDate('<%=DateNow%>', 'RecurrenceStartDateTime', true);"><%=DateNow%></a>&nbsp;]</span></span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol requiredInput">
                                                                    <label for="RecurrenceEndDateOnly">
                                                                        定期结束</label>
                                                                </td>
                                                                <td class="data2Col col02">
                                                                    <div class="requiredInput">
                                                                        <div class="requiredBlock">
                                                                        </div>
                                                                        <span class="dateInput dateOnlyInput">
                                                                            <input id="RecurrenceEndDateOnly" name="RecurrenceEndDateOnly" onfocus="DatePicker.pickDate(false, 'RecurrenceEndDateOnly', false);"
                                                                                size="12" type="text" value="<%=RecurrenceEndDateTime%>" /><span id="maxRecurrence"><span
                                                                                    class="dateFormat">[&nbsp;<a href="javascript:ActivityFunction.calculateRecurrenceEnd%28%27RecurrenceEndDateOnly%27%2C%20%27IsRecurrence%27%2C%20%27Event%27%2C%20%27%27%29">计算最大结束日期</a>&nbsp;]</span>&nbsp;<div
                                                                                        class="mouseOverInfoOuter" onfocus="addMouseOver(this)" onmouseover="addMouseOver(this)"
                                                                                        tabindex="0">
                                                                                        <img src="/s.gif" alt="" class="infoIcon" title="" /><div class="mouseOverInfo" style="display: none;">
                                                                                            您必须为重复事件指定结束日期。单击链接基于您选择的频率计算允许的最大结束日期，同时把结束日期设定为此最大值。
                                                                                        </div>
                                                                                    </div>
                                                                                </span></span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_4_ep">
                                        <h3>提醒<span class="titleSeparatingColon">:</span></h3>
                                    </div>
                                    <div class="pbSubsection">
                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="labelCol">提醒
                                                </td>
                                                <td class="data2Col" colspan="3" style="">
                                                    <div>
                                                        <input checked="checked" id="reminder_select_check" name="IsReminderSet" onclick="ActivityFunction.adjustEventReminderOptions(false, 'evt15', false, 'IsRecurrence', 'reminder_dt_time');"
                                                            title="设置提醒开/关" type="checkbox" value="1" /><label for="reminder_select_check"></label><span><select
                                                                id="reminder_lt" name="ReminderDateTime" title="事件的提醒提前期"><option value="0">0 分钟</option>
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
                                                            </select><span class="dateInput dateOnlyInput" style="display: none"><input id="reminder_dt"
                                                                name="reminder_dt" onfocus="DatePicker.pickDate(false, 'reminder_dt', false);"
                                                                size="10" title="提醒日期" type="text" value="<%=ScheduledStart%>" /><select id="reminder_dt_time"
                                                                    name="reminder_dt_time" title="提醒时间"><option value="0">上午12:00</option>
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
                                                                </select></span><span class="dateInput dateOnlyInput" style="display: none">每次出现的
                                                                <select id="reminder_ldt" name="reminder_ldt" title="事件之前的提醒天数">
                                                                    <option value="0" selected="selected">出现日期</option>
                                                                    <option value="1">1 天前</option>
                                                                    <option value="2">2 天前</option>
                                                                    <option value="3">3 天前</option>
                                                                    <option value="4">4 天前</option>
                                                                    <option value="5">5 天前</option>
                                                                    <option value="6">6 天前</option>
                                                                    <option value="7">1 个星期前</option>
                                                                    <option value="14">2 个星期前</option>
                                                                </select>
                                                                    于
                                                                <select id="reminder_ldt_time" name="reminder_ldt_time" title="提醒时间">
                                                                    <option value="0">上午12:00</option>
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
                                                                </select>
                                                                </span></span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="labelCol">通知
                                                </td>
                                                <td class="dataCol col02" style="vertical-align: middle; height: 20px;">&nbsp;<input type="checkbox" name="chkSms" id="chkSms" value="2" />短信<input type="checkbox" name="chkEmail" id="chkEmail" value="1"  />邮件
                                               <input type="checkbox" name="chkMessage" id="chkMessage" value="3" checked />即时消息
                                                </td>
                                                <td class="empty labelCol">&nbsp;
                                                </td>
                                                <td class="empty dataCol">&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="empty labelCol last">&nbsp;
                                                </td>
                                                <td class="empty dataCol col02 last">&nbsp;
                                                </td>
                                                <td class="empty labelCol last">&nbsp;
                                                </td>
                                                <td class="empty dataCol last">&nbsp;
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
                                                <input value=" 保存 " class="btn" name="save" tabindex="14" title="保存" type="submit" style="height:25px;" /><!--
                                            <input value="保存并新建任务" class="btn" name="savenewtask" tabindex="15" title="保存并新建任务"
                                                type="submit" />-->
                                                <input value="保存并新建事件" class="btn" name="savenewevent" tabindex="16" title="保存并新建事件"
                                                    type="submit"  style="height:25px;" />
                                                <input value=" 取消 " class="btn" name="cancel" tabindex="17" title="取消" type="submit"  style="height:25px;"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="pbFooter secondaryPalette">
                                    <div class="bg">
                                    </div>
                                </div>
                            </div>
                            <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "savenewtask", "savenewevent", "cancel"]); }</script>
                            <!-- Begin RelatedListElement -->
                            <div class="first bRelatedList" id="RelatedActivityAttachmentList" style="display: none">
                                <a name="RelatedActivityAttachmentList_target"></a>
                                <!-- Begin ListElement -->
                                <!-- motif: Event -->
                                <!-- WrappingClass -->
                                <div class="noStandardTab">
                                    <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif"
                                                            alt="" class="relatedListIcon" title="" /><h3 id="RelatedActivityAttachmentList_title">附件</h3>
                                                    </td>
                                                    <td class="pbButton">
                                                        <input value=" 附加文件 " class="btn" name="attachFile" onclick="setLastMousePosition(event); openPopup('/p/attach/ActivityAttach?relatedListId=RelatedActivityAttachmentList&retURL=%2F00U%2Fe%3FretURL%3D%252Fhome%252Fhome.jsp&pid=000000000000000&type=00U', 'doc', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);"
                                                            title="附加文件" type="button" />&nbsp;
                                                    </td>
                                                    <td class="pbHelp">&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody" id="RelatedActivityAttachmentList_body">
                                            <table class="list" border="0" cellspacing="0" cellpadding="0">
                                                <tr class="headerRow">
                                                    <th scope="col" class="noRowsHeader">没有可显示的记录
                                                    </th>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listElementBottomNav">
                                </div>
                                <script>                                try { sfdcPage.registerRelatedList('RelatedActivityAttachmentList', '0', '附件', false, '/00U/e?retURL=%2Fhome%2Fhome.jsp', 'retURL=%2Fhome%2Fhome.jsp&relatedListId=RelatedActivityAttachmentList&hideDL=1&noh=1&keepPref=1', false, false, true, 'RelatedActivityAttachmentList'); } catch (e) { }</script>
                                <!-- End ListElement -->
                            </div>
                            <!-- End RelatedListElement -->
                            <!--
                        <div class="fewerMore">
                            <div class="backToTop">
                                <a href="#skiplink" title="返回顶部">
                                    <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                            每一相关列表总是显示 <a href="/00U/e?retURL=%2Fhome%2Fhome.jsp&amp;rowsperlist=10">
                                <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a> 项记录</div>-->
                            <br />
                            <br />
                            <div style="position: relative; width: 100%;">
                                <div class="bodyBold" style="position: absolute; bottom: 0px">
                                    选择被邀请人
                                </div>
                                <div class="bodyBold" style="text-align: right">
                                </div>
                            </div>
                            <script>                            var dialog = OverlayDialogElement.getDialog('invitee_picker_');
                                dialog.isModal = true;
                                dialog.width = 762;
                                dialog.hasButtonsBar = true;
                                dialog.displayX = true;
                                dialog.allowKeyboardEsc = true;
                                dialog.extraClass = '';
                                dialog.isAbsolutePositioned = false;
                                dialog.refreshOnClose = false;
                                dialog.isMovable = true;
                                dialog.buttonContents = '\u003Cinput value=\" 完成 \"  class=\"btn\" id=\"invitee_picker_save_btn\" name=\"saveBtn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onPickerDone();\" title=\"完成 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"invitee_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onPickerCancel();\" title=\"取消 (Esc)\" type=\"button\" /\u003E';
                                dialog.setTitle('选择被邀请人');
                                dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"invitee_picker_header_label\"\u003E\u003C/div\u003E\u003Cdiv class=\"mw_container\"\u003E\u003Cdiv class=\"search_area\"\u003E\u003Clabel for=\"invitee_picker_search_prefix\"\u003E搜索\u003C/label\u003E\u003Cselect  id=\"invitee_picker_search_types\" name=\"invitee_picker_search_types\"\u003E\u003Coption value=\"myunit\"\u003E本部门用户\u003C/option\u003E\n\u003Coption value=\"all\"\u003E用户、潜在客户和联系人\u003C/option\u003E\n\u003Coption value=\"005\"\u003E用户\u003C/option\u003E\n\u003Coption value=\"00Q\"\u003E潜在客户\u003C/option\u003E\n\u003Coption value=\"003\"\u003E联系人\u003C/option\u003E\n\u003Coption value=\"023\"\u003E资源\u003C/option\u003E\n\u003C/select\u003E\u003Cdiv class=\"search_text_div\" id=\"invitee_picker_search_text_div\"\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"search_text_icon\" title=\"\" /\u003E\u003Cinput  class=\"search_text\" id=\"invitee_picker_search_prefix\" maxlength=\"30\" name=\"invitee_picker_search_prefix\" onkeydown=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyDown(event)\" onkeyup=\"Sfdc.Activity.PeoplePicker.invitee.onSearchKeyUp(event)\" size=\"20\" type=\"text\" value=\"\" /\u003E\u003Cimg src=\"/s.gif\" alt=\"\" class=\"clear_text_icon\" alt=\"清除搜索词\" id=\"invitee_picker_search_clear_text_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonClick(event)\" onkeypress=\"Sfdc.Activity.PeoplePicker.invitee.onSearchClearButtonKeyPress(event)\" tabindex=\"0\" title=\"清除搜索词\" /\u003E\u003C/div\u003E\u003Cinput value=\" 查找 \"  class=\"btn\" id=\"invitee_picker_search_btn\" name=\"invitee_picker_search_btn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onSearch();\" title=\"查找\" type=\"button\" /\u003E\u003C/div\u003E\u003Cdiv class=\"message infoM4 overlimit_results\" id=\"invitee_picker_overlimit_results_message\"\u003E\u003Ctable  class=\"messageTable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\u003E\u003Ctr\u003E\u003Ctd\u003E\u003Cimg src=\"/s.gif\" alt=\"信息\"  class=\"msgIcon\" title=\"信息\"/\u003E\u003C/td\u003E\u003Ctd class=\"messageCell\"\u003E\u003Cdiv class=\"messageText\"\u003E前 300 个结果显示如下。您可以精简搜索，以缩短列表。\u003C/div\u003E\u003C/td\u003E\u003C/tr\u003E\n\u003C/table\u003E\u003C/div\u003E\u003Cscript\u003Eif (window.sfdcPage) sfdcPage.registerMessage(\'invitee_picker_overlimit_results_message\');\u003C/script\u003E\u003Cdiv class=\"mw_list_area\" id=\"invitee_picker_list_area\"\u003E\u003Cdiv class=\"found_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_found_label\"\u003E可用： \u003C/div\u003E\u003Cdiv class=\"mw_list\" id=\"invitee_picker_loading_icon_div\" style=\"display: none;\"\u003E\u003Cimg src=\"/img/loading.gif\" alt=\"请稍候...\" class=\"mw_loading\" title=\"请稍候...\" /\u003E\u003Cspan class=\"mw_loading\"\u003E正在加载...\u003C/span\u003E\u003C/div\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_found_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003Cdiv class=\"add_remove\"\u003E添加\u003Cbr/\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_add_button\" name=\"add_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onAdd();\"\u003E\u003Cdiv class=\"rightArrowIcon\" title=\"添加\"\u003E\u003C/div\u003E\u003C/a\u003E\u003Ca href=\"javascript:void(0)\" id=\"invitee_picker_remove_button\" name=\"remove_button\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onRemove();\"\u003E\u003Cdiv class=\"leftArrowIcon\" title=\"删除\"\u003E\u003C/div\u003E\u003C/a\u003E删除\u003C/div\u003E\u003Cdiv class=\"selected_results\" unselectable=\"on\"\u003E\u003Cdiv class=\"list_label\" id=\"invitee_picker_selected_label\"\u003E已选取： \u003C/div\u003E\u003Cdiv id=\"invitee_picker_inner_selected_div\"\u003E\u003Cul class=\"mw_list\" id=\"invitee_picker_selected_list_id\" onblur=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocusOut(event);\" onfocus=\"Sfdc.Activity.PeoplePicker.invitee.handleListFocus(event);\" role=\"listbox\" unselectable=\"on\"\u003E\u003C/ul\u003E\n\u003C/div\u003E\u003C/div\u003E\u003Cdiv style=\"clear: both\"\u003E\u003C/div\u003E\u003C/div\u003E\u003Cdiv class=\"limit_exceeded_message\" id=\"invitee_picker_limit_exceeded_message\"\u003E\u003C/div\u003E\u003C/div\u003E\u003C/div\u003E';

                            </script>
                            <input type="hidden" id="editEventCalendar_manyWId" name="editEventCalendar_manyWId"
                                value="" /><input type="hidden" id="editEventCalendar_manyWName" name="editEventCalendar_manyWName"
                                    value="[]" /><input type="hidden" id="editEventCalendar_manyWTitle" name="editEventCalendar_manyWTitle"
                                        value="[]" /><input type="hidden" id="editEventCalendar_manyWCompany" name="editEventCalendar_manyWCompany"
                                            value="[]" /><input type="hidden" id="editEventCalendar_manyWOwner" name="editEventCalendar_manyWOwner"
                                                value="[]" />
                            <!-- ===xyzCALENDARzyx=== -->
                            <span id="editEventCalendar" class="brandSecondaryBrd">
                                <div class="calendarHeader">
                                    <script class="extra">                                    var addInvitees = function (event) { setLastMousePosition(event); ActivityFunction.openInviteePicker(); Sfdc.Activity.PeoplePicker.invitee.onSearch(); };</script>
                                    <input value=" 选择 " class="extra btn" id="addInviteesButton" name="new" onclick="addInvitees(event)"
                                        title="选择" type="button" /><div class="legend">
                                            <div class="busy">
                                                &nbsp;
                                            </div>
                                            <span>繁忙</span><div class="outOfOffice">
                                                &nbsp;
                                            </div>
                                            <span>不在办公室</span>
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="dateDiv">
                                        ,<%=DateTime.Now.ToString("yyyy年MM月dd日")%>
                                    </div>
                                </div>
                                <div class="pbBody">
                                    <div class="multiuserCalendar dayView">
                                        <table class="calendarTable" border="0" cellspacing="0" cellpadding="0">
                                            <tr class="emptyRow">
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="headerRow">
                                                <th class="cbCol" scope="col">操作
                                                </th>
                                                <th class="nameCol" id="nameCol" scope="col">邀请
                                                </th>
                                                <th class="typeCol" scope="col">类型
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">上午6:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">上午7:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">上午8:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">上午9:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">上午10:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">上午11:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午12:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午1:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午2:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午3:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午4:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午5:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午6:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午7:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午8:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午9:00
                                                </th>
                                                <th class="timeCol" colspan="2" scope="col">下午10:00
                                                </th>
                                                <th class="timeCol last" colspan="2" scope="col">下午11:00
                                                </th>
                                            </tr>
                                            <!-- <tr class="even">
                                            <td class="cbCol">
                                                &nbsp;
                                            </td>
                                            <th class="nameCol" scope="row">
                                                liu jack
                                            </th>
                                            <td class="typeCol">
                                                用户
                                            </td>
                                            <td class="mins first" colspan="36">
                                                &nbsp;
                                            </td>
                                        </tr>-->
                                            <%=InviteeCalendarHTML%>
                                        </table>
                                    </div>
                                </div>
                                <script>      if (window.Hover) { setTimeout(Hover.disableHovers, 7103000) }</script>
                                <%=InviteeHiddenHTML%>
                            </span>
                            <!-- ===xyzCALENDARzyx=== -->
                        </form>
                        <!-- Body events -->

                        <script type="text/javascript">    function bodyOnLoad() { new ForeignKeyInputElement("evt3", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "006" }); new Sfdc.Activity.ManyWhoForeignKeyInputElement("evt2", "/_ui/common/data/LookupValidationServlet", null, false, { "acent": "003" }); ActivityFunction.initWhoWhatFields('00Q', 'evt2', 'evt2_lkid', 'whobtn', 'evt2_mlktp', 'evt3', 'evt3_lkid', 'whtbtn', 'evt3_mlktp', 'IsVisibleInSelfService', 'evt1_lkid', '0059000000390Wh'); handleTextAreaElementChangeWithByteCheck('evt6', 32000, 0, '剩余', '超出极限'); LookupAutoCompleteInputElement.registerSupportedEntities("evt1", {}); LookupAutoCompleteInputElement.registerSupportedEntities("evt2", {}); ActivityFunction.adjwht('evt2_mlktp'); LookupAutoCompleteInputElement.registerSupportedEntities("evt3", {}); ActivityFunction.adjustEventReminderOptions(false, 'evt15', false, 'IsRecurrence', 'reminder_dt_time'); ActivityFunction.saveStartTime('StartDateTime', 'StartDateTime_time'); ActivityFunction.checkDuration('IsRecurrence', 'evt15', 'StartDateTime', 'StartDateTime_time', 'EndDateTime', 'EndDateTime_time'); Sfdc.Activity.ManyWhoFunction.setRefVarsForManyWho(true, 'IsRecurrence', null, null); TaskEditPage.isManyWhoReady = true; Sfdc.Activity.ManyWhoFunction.setLookupInfo('evt2', true, 'IsPrivate'); ActivityFunction.isRecurrence = false; ActivityFunction.isOccurrence = false; setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, 'hVOplY3bLG6Q3xsEbNE9L3VxZZBDzK22D_7dRvq2NL5Z5qk0E8DSH43eYSqiN4KMVtfO0GNHsdBLIq405q_A4zmaxAE4lCuTUsGtgq0vDGrzsV.izcJeg.V5Hlt_BGtIp8NQmmXIfwvh4gfqdfQvaLqUUFTYMdeXt5FCrjhfTNu_.zzO'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen');; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2F00U%2Fe%3Fevt4%3D2015-5-20%26aid%3D005900000039oIN%26anm%3Dliu%2Blan%26retURL%3D%252F00U%252Fc%253FcType%253D1%2526cal%253Dliu%252Blan%2526cal_lkid%253D005900000039oIN%2526cal_lkold%253Dliu%252Blan%2526cal_lspf%253D1%2526md0%253D2015%2526md3%253D140&isAjaxRequest=1&renderMode=RETRO&nocache=1432095294497'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "bJfk3CRwHG2oPeOWK5Tyz7p.kJyEjTKsXbJ02PgGSMisG3LKnOIFLBflG.UVz.2xHk4HgvCQrPLnAMlD3KeLbSwkr07pJttnDLPemSAZkGmECGFtxwK3hCHd3TJuJ2xgLzTSGCIr8vKdRezxZcjXaEyw6m1oS_VATbo2NSj_nh9iUMIGZqFcwhPbljUJD8dvG0Xqxw=="; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
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
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    -->
</body>
</html>
<!-- page generation time: 77ms -->
